<?php 

class Message_model extends CI_Model {
    public function getMessage() {
        return $this->db->get('message')->result_array();
    }

    public function createMessage($data) {
        $this->db->insert('message', $data);
        return $this->db->affected_rows();
    }
}

?>