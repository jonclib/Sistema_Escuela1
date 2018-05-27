<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Estudiantes_controller extends CI_Controller {
	
	public function index()
	{
		$data['usuario'] = $this->session->userdata('usuario');
		$data['contrasena'] = $this->session->userdata('contrasena');         

		$data['datos'] = $this->estudiantes_model->seleccionarEstudiantes();      

		$this->load->view('include/header');
		$this->load->view('include/navbar',$data);
		$this->load->view('include/sidebar');
		$this->load->view('admin/estudiantes',$data);
		$this->load->view('include/footer');
	}


	 public function agregarEstudiantes()	{                 
                   
				
			if (isset($_POST['submit'])) {	

		    $nombre = $this->input->post('nombre');
			$apellido = $this->input->post('apellido');			
			$email = $this->input->post('email');
			$session = $this->input->post('session');
			$turno = $this->input->post('turno');
			$sede = $this->input->post('sede');			

			$this->estudiantes_model->agregarEstudiantes($nombre ,$apellido ,$email ,$session ,$turno ,$sede);

			redirect(base_url("index.php/estudiantes_controller"));			
                         	
            } else {			

			redirect(base_url("index.php/dashboard_controller"));
		}
			

		

	}


		public function totalEstudiantes()
	{
		
		$data['dato'] = $this->estudiantes_model->totalEstudiantes();
		
		$this->load->view('admin/dashboard',$data);
		
	}

	public function reporteEstudiantes()	{       	
	
	 $data = $this->estudiantes_model->seleccionarEstudiantes();
	

	 $totalE = $this->estudiantes_model->totalEstudiantes();  

	 // Creacion del PDF
 
    /*
     * Se crea un objeto de la clase Pdf, recuerda que la clase Pdf
     * heredó todos las variables y métodos de fpdf
     */

	 $this->pdf = new fpdf();
    // Agregamos una página
    $this->pdf->AddPage();
    // Define el alias para el número de página que se imprimirá en el pie
    $this->pdf->AliasNbPages();
 
    /* Se define el titulo, márgenes izquierdo, derecho y
     * el color de relleno predeterminado
     */
    $this->pdf->SetTitle("Reporte Estudiantes SchoolCastro 2.0");
    $this->pdf->SetLeftMargin(15);
    $this->pdf->SetRightMargin(15);
    $this->pdf->SetFillColor(200,200,200);
 
    // Se define el formato de fuente: Arial, negritas, tamaño 9
    $this->pdf->SetFont('Arial', 'B', 9);
    /*
     * TITULOS DE COLUMNAS
     *
     * $this->pdf->Cell(Ancho, Alto,texto,borde,posición,alineación,relleno);
     */
 
    $this->pdf->Cell(20,5,'ID','TBL',0,'L','1');
    $this->pdf->Cell(20,5,'Nombre','TB',0,'L','1');
    $this->pdf->Cell(20,5,'Apellido','TB',0,'L','1');
    $this->pdf->Cell(20,5,'Session','TB',0,'L','1');
    $this->pdf->Cell(20,5,'Turno','TB',0,'L','1');
    $this->pdf->Cell(30,5,'Sede','TB',0,'L','1');      
    $this->pdf->Ln(7);
    // La variable $x se utiliza para mostrar un número consecutivo
    // $x = 1;
    foreach ($data as $datos) {
      // se imprime el numero actual y despues se incrementa el valor de $x en uno
      // $this->pdf->Cell(15,5,$x++,'BL',0,'C',0);
      // Se imprimen los datos de cada alumno
      $this->pdf->Cell(20,5,$datos->id,'B',0,'L',0);
      $this->pdf->Cell(20,5,$datos->nombre,'B',0,'L',0);
      $this->pdf->Cell(20,5,$datos->apellido,'B',0,'L',0);
      $this->pdf->Cell(20,5,$datos->session,'B',0,'L',0);
      $this->pdf->Cell(20,5,$datos->turno,'B',0,'L',0);
      $this->pdf->Cell(30,5,$datos->sede,'B',0,'L',0);
     
      //Se agrega un salto de linea
      $this->pdf->Ln(5);
    }

    $this->pdf->Cell(30,5,'Total Fecha:','TB',0,'L','1');
 	$this->pdf->Cell(30,5, date("d-m-y"),'B',0,'L',0);
 	$this->pdf->Ln(5);
 	$this->pdf->Cell(30,5,'Total Estudiantes:','TB',0,'L','1');
 	$this->pdf->Cell(30,5, $totalE->totalestudiantes,'B',0,'L',0);
  
    /*
     * Se manda el pdf al navegador
     *
     * $this->pdf->Output(nombredelarchivo, destino);
     *
     * I = Muestra el pdf en el navegador
     * D = Envia el pdf para descarga
     *
     */
    $this->pdf->Output("Reporte estudiantes SchoolCastro 2.0.pdf", 'D');
		
	} 



}