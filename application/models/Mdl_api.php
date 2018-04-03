<?php
class Mdl_api extends CI_Model
{
	function __construct()
	{
		parent::__construct();
		$this->load->database(); 		
	}
	
	public function register_user($data) 
	{ 
        $data['password'] = md5($data['password']);
        $data['created_at'] = date('Y-m-j H:i:s'); 
        $this->db->insert('users', $data);
		return $this->db->insert_id();
    }
	
	public function login($email_id,$password) 
	{ 
		$pass = md5($password);
		$this->db->select('id');
        $this->db->from('users');
        $this->db->where('email', $email_id);
        $this->db->where('password', $pass);
        return $this->db->get()->row('id');
	}
}
?>