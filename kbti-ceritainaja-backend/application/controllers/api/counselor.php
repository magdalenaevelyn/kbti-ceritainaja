<?php

use Restserver\Libraries\REST_Controller;

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Counselor extends REST_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('Counselor_model', 'counselor');
    }

    // get data counselor
    public function getCounselor_get() {
        $counselor = $this->counselor->getCounselor();
        $this->response($counselor, 200);
        // if ($counselor != null) {
        //     $this->response([
        //         'status' => true,
        //         'data' => $counselor
        //     ], REST_Controller::HTTP_OK);
        // } else {
        //     $this->response([
        //         'status' => false,
        //         'message' => "There is no counselor"
        //     ], REST_Controller::HTTP_NOT_FOUND);
        // }
    }
}
?>