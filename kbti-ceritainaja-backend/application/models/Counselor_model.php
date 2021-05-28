<?php 

class Counselor_model extends CI_Model {
    public function getCounselor() {
        return $this->db->get('counselor')->result_array();
    }
}
?>