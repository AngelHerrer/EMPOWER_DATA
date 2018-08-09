<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\T_calificaciones;
use Illuminate\Support\Facades\DB;

class AlumnosController extends Controller {

    public function CreateQualification(Request $request) {
        $json = $request->input('json', null);
        $params = json_decode($json);
        $paramsArray = json_decode($json, true);

        $validate = \Validator::make($paramsArray, [
                    'id_t_usuarios' => 'required|numeric',
                    'id_t_materias' => 'required|numeric',
                    'calificacion' => 'required|numeric|max:10|min:0'
        ]);

        if ($validate->fails()) {
            return response()->json($validate->errors(), 400);
        }

        $id_t_calificaciones = (!is_null($json) && isset($params->id_t_calificaciones)) ? $params->id_t_calificaciones : null;
        $id_t_materias = (!is_null($json) && isset($params->id_t_materias)) ? $params->id_t_materias : null;
        $id_t_usuarios = (!is_null($json) && isset($params->id_t_usuarios)) ? $params->id_t_usuarios : null;
        $calificacion = (!is_null($json) && isset($params->calificacion)) ? $params->calificacion : null;
        $fecha_registro = date('Y-m-d');


        $t_calificaciones = new T_calificaciones();

        $lastValue = DB::table('t_calificaciones')->orderBy('id_t_calificaciones', 'desc')->first();

        $t_calificaciones->id_t_calificaciones = ($lastValue->id_t_calificaciones) + 1;
        $t_calificaciones->id_t_materias = $id_t_materias;
        $t_calificaciones->id_t_usuarios = $id_t_usuarios;
        $t_calificaciones->calificacion = $calificacion;
        $t_calificaciones->fecha_registro = $fecha_registro;

        $t_calificaciones->save();

        if ($t_calificaciones) {
            $data = array(
                'success' => 'ok',
                'msg' => 'calificacion registrada'
            );
        }

        return response()->json($data, 200);
    }

    public function GetQualification(Request $request, $id_t_usuarios) {

        $promedio = 0;

        $califiaciones = DB::table('t_calificaciones as c')
                ->where('c.id_t_usuarios', $id_t_usuarios)
                ->join('t_alumnos as a', 'c.id_t_usuarios', '=', 'a.id_t_usuarios')
                ->join('t_materias as m', 'c.id_t_materias', '=', 'm.id_t_materias')
                ->select('c.id_t_usuarios', 'a.nombre', 'a.ap_paterno', 'a.ap_materno', 'm.nombre as materia', 'c.calificacion', 'c.fecha_registro')
                ->get();
        foreach ($califiaciones as $califiacion) {

            $promedio += (int) $califiacion->calificacion;

            $alumno[] = array('id_t_usuarios' => $califiacion->id_t_usuarios,
                'nombre' => $califiacion->nombre,
                'ap_paterno' => $califiacion->ap_paterno,
                'ap_materno' => $califiacion->ap_materno,
                'materia' => $califiacion->materia,
                'calificacion' => $califiacion->calificacion,
                'fecha_registro' => date('d-m-Y', strtotime($califiacion->fecha_registro)),
            );
        }
        $finalPromedio = array('promedio' => $promedio / count($califiaciones));

        array_push($alumno, $finalPromedio);

        return response()->json($alumno, 200);
    }

    public function UpdateQualification($usuario, $materia, $calificacion) {

        $paramsArray = array(
            'usuario' => (int) $usuario,
            'materia' => (int) $materia,
            'calificacion' => (int) $calificacion
        );

        $validate = \Validator::make($paramsArray, [
                    'usuario' => 'required|numeric',
                    'materia' => 'required|numeric',
                    'calificacion' => 'required|numeric|max:10|min:0'
        ]);

        if ($validate->fails()) {
            return response()->json($validate->errors(), 400);
        }

        $updateQualification = DB::table('t_calificaciones')
                ->where('id_t_materias', $usuario)
                ->where('id_t_usuarios', $materia)
                ->update(['calificacion' => $calificacion]);

        if ($updateQualification) {
            $data = array(
                'success' => 'ok',
                'msg' => 'calificacion actualizada'
            );
        } else {
            $data = array(
                'success' => 'false',
                'msg' => 'no se pudo actualizar verifique que el alumno o materia sean las correctas'
            );
        }
        return response()->json($data, 200);
    }

    public function DeleteQualification($usuario, $materia) {

        $deleteQualification = DB::table('t_calificaciones')
                ->where('id_t_materias', $usuario)
                ->where('id_t_usuarios', $materia)
                ->delete();

        if ($deleteQualification) {
            $data = array(
                'success' => 'ok',
                'msg' => 'calificacion eliminada'
            );
        } else {
            $data = array(
                'success' => 'false',
                'msg' => 'verifique que el id sea el correcto'
            );
        }

        return response()->json($data, 200);
    }

}
