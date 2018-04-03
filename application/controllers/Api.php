<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Api extends CI_Controller {
 public function __construct() {
        parent::__construct(); 
         $this->load->model('Mdl_api');
    }
	
	public function index()
	{ 
		$this->load->view('api');
	}
	
	public function api()
	{
		$name = $this->input->post('name', TRUE);
		$email = $this->input->post('email', TRUE);
		$address = $this->input->post('address', TRUE);
		$law_firm_name = $this->input->post('law_firm_name', TRUE);
		$phone = $this->input->post('phone', TRUE);
		$area_of_low_id = $this->input->post('area_of_low_id', TRUE);
		$password = $this->input->post('password', TRUE);
	   
		
		$data=array('name'=>$name,'email'=>$email,'address'=>$address,'law_firm_name'=>$law_firm_name,'phone'=>$phone,'area_of_low_id'=>$area_of_low_id,'password'=>$password);
		
		$last_id = $this->Mdl_api->register_user($data);
		
		$myJSON = json_encode($data);
		echo $myJSON;
	}
	
	public function login()
	{
		$email_id = $this->input->post('email_id', TRUE);
		$password = $this->input->post('password', TRUE);
		 
		$last_id = $this->Mdl_api->login($email_id,$password);
		if($last_id != null)
		{
			$array=array('success'=>'Logged In'); 
			$myJSON = json_encode($array);
			echo $myJSON;
		}else
		{
			$array=array('errorMessage'=>'Please Try Again'); 
			$myJSON = json_encode($array);
			echo $myJSON;
		}
		
	}
}

