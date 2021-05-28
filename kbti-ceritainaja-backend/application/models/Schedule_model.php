<?php 

class Schedule_model extends CI_Model {
    protected $table = 'schedule';

    public function getSchedule($idSchedule = 0) {
        if(!empty($idSchedule)) {
            return $this->db->get_where("schedule", ['idSchedule' => $idSchedule])->row_array();
        } else {
            // return $this->db->get('schedule')->result_array();
            return $this->db->get('schedule')->result();
        }
    }

    public function createSchedule($data) {
        $this->db->insert('schedule', $data);
        return $this->db->affected_rows();
    }
    
    public function updateSchedule($data, $idSchedule) {
        $this->db->where('idSchedule', $idSchedule);
        $this->db->update('schedule', $data);
        return $this->db->affected_rows();
    }

    public function scheduleStatus($idSchedule) {
        $this->db->where('idSchedule', $idSchedule);
        $this->db->update('isAccept', 0);
        return $this->db->affected_rows();
    }
}

?>