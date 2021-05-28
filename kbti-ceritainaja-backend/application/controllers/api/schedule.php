<?php

use Restserver\Libraries\REST_Controller;
// use Application\Models\Schedule_model;

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Schedule extends REST_Controller {
    protected $format       = 'json';
    protected $modelName    = 'Application\Models\Schedule_model';

    public function __construct() {
        parent::__construct();
        $this->load->model('Schedule_model', 'schedule');
        // $this->schedule = new Schedule_model;
    }

    // get data schedule
    public function getSchedule_get() {
        $schedule = $this->schedule->getSchedule();
        $this->response($schedule, 200);
        // if ($schedule != null) {
        //     $this->response([
        //         // 'status' => true,
        //         'data' => $schedule
        //     ], REST_Controller::HTTP_OK);
        // } else {
        //     $this->response([
        //         // 'status' => false,
        //         'message' => "There is no schedule"
        //     ], REST_Controller::HTTP_NOT_FOUND);
        // }
        // foreach ($schedulee as $row) { 
 
        //     $schedule[] = [
        //         'idSchedule' => $row->idSchedule,
        //         'name' => $row->name,
        //         'age' => $row->age,
        //         'problem' => $row->problem,
        //         'date' => $row->date,
        //         'counselor' => $row->counselor,
        //         'fixSchedule' => $row->fixSchedule,
        //         'isAccept' => $row->isAccept
        //     ];
        //     return $this->respond($schedule, 200);
         
        // } 
    }

    // get schedule by id
    public function getScheduleById_get($idSchedule = 0) {
        if(!empty($idSchedule)) {
            $schedule = $this->db->get_where("schedule", ['idSchedule' => $idSchedule])->row_array();
        }
        
        $this->response($schedule, 200);
    }

    // create schedule
    public function createSchedule_post() {
        $idSchedule = $this->db->escape_str($this->post('idSchedule'));
        $name = $this->db->escape_str($this->post('name'));
        $age = $this->db->escape_str($this->post('age'));
        $problem = $this->db->escape_str($this->post('problem'));
        $date = $this->db->escape_str(date('Y-m-d', strtotime($this->post('date'))));
        $counselor = $this->db->escape_str($this->post('counselor'));

        $data = [
            'idSchedule' => $idSchedule,
            'name' => $name,
            'age' => $age,
            'problem' => $problem,
            'date' => $date,
            'counselor' => $counselor
        ];

        $schedule = $this->schedule->createSchedule($data);
        if ($schedule > 0) {
            $this->response([
                'status' => true,
                'message' => 'New schedule has been created'
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'status' => false,
                'message' => "Failed to create a new schedule"
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    // user fixed their schedule (in Andro just view and press button fixed)
    public function updateSchedule_post() {
        $dateFormat = "Y-m-d";
        $idSchedule = $this->db->escape_str($this->input->post('idSchedule'));
        // $age = $this->db->escape_str($this->input->post('age'));
        // $problem = $this->db->escape_str($this->post('problem'));
        // $date = $this->db->escape_str(date('Y-m-d', strtotime($this->post('date'))));
        // $counselor = $this->db->escape_str($this->post('counselor'));
        $fixSchedule = $this->db->escape_str($this->post('fixSchedule'));

        $data = [
            // 'age' => $age,
            // 'problem' => $problem,
            // 'date' => $date,
            // 'counselor' => $counselor,
            'fixSchedule' => $fixSchedule
        ];

        $schedule = $this->schedule->updateSchedule($data, $idSchedule);
        if ($schedule > 0) {
            $this->response([
                'status' => true,
                'message' => 'schedule has been updated'
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response([
                'status' => false,
                'message' => "Failed to update schedule"
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    // counselor accept / deny the schedule
    public function acceptSchedule_post($idSchedule, $isAccept) {
        // $idSchedule = $this->db->escape_str($this->input->post('idSchedule'));
        // $isAccept = $this->db->escape_str($this->post('isAccept'));

        $data = [
            'idSchedule' => $idSchedule,
            'isAccept' => $isAccept
        ];

        $schedule = $this->schedule->updateSchedule($data, $idSchedule);
        if ($schedule > 0) {
            $this->response([
                'status' => true,
                'message' => 'schedule has been accepted or denied'
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response([
                'status' => false,
                'message' => "Failed to update the schedule's status"
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
}
?>