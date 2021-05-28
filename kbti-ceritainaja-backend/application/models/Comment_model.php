<?php 

class Comment_model extends CI_Model {
    public function getComment() {
        return $this->db->get('comment')->result_array();
    }

    public function createComment($data) {
        $this->db->insert('comment', $data);
        return $this->db->affected_rows();
    }

    public function deleteComment($idComment) {
        $this->db->delete('comment', ['idComment' => $idComment]);
        return $this->db->affected_rows();
    }
}

?>