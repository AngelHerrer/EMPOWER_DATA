<?php

/*
  |--------------------------------------------------------------------------
  | Web Routes
  |--------------------------------------------------------------------------
  |
  | Here is where you can register web routes for your application. These
  | routes are loaded by the RouteServiceProvider within a group which
  | contains the "web" middleware group. Now create something great!
  |
 */

Route::get('/', function () {
    return view('welcome');
});

Route::resource('/api/alumnos', 'AlumnosController');

Route::post('/api/CreateQualification', 'AlumnosController@CreateQualification');

Route::get('/api/GetQualification/{id_t_usuarios}', 'AlumnosController@GetQualification');

Route::put('/api/UpdateQualification/{usuario}/{materia}/{calificacion}', 'AlumnosController@UpdateQualification');

Route::delete('/api/DeleteQualification/{usuario}/{materia}', 'AlumnosController@DeleteQualification');