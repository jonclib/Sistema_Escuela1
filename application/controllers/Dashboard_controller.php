<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard_controller extends CI_Controller {
	
	public function index()
	{
		$data['usuario'] = $this->session->userdata('usuario');
		$data['contrasena'] = $this->session->userdata('contrasena');

		$data['tUsuarios'] = $this->usuarios_model->totalUsuarios();
		$data['tEstudiantes'] = $this->estudiantes_model->totalEstudiantes();
		$data['tProfesores'] = $this->profesores_model->totalProfesores();
		$data['tAprobados'] = $this->calificaciones_model->estudiantesAprobados();

		$this->load->view('include/header');
		$this->load->view('include/navbar',$data);
		$this->load->view('include/sidebar');
		$this->load->view('admin/dashboard');
		$this->load->view('include/footer',$data);
	}



}
