<?php

use Restserver\Libraries\REST_Controller;

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Message extends REST_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('Message_model', 'message');
    }

    // get data message
    public function getMessage_get() {
        $message = $this->message->getMessage();
        $this->response($message, 200);

        // if ($message != null) {
        //     $this->response([
        //         'status' => true,
        //         'data' => $message
        //     ], REST_Controller::HTTP_OK);
        // } else {
        //     $this->response([
        //         'status' => false,
        //         'message' => "There is no registered class"
        //     ], REST_Controller::HTTP_NOT_FOUND);
        // }
    }

    // create new message
    public function createMessage_post() {
        $text = $this->db->escape_str($this->post('text'));
        // $messageType = $this->db->escape_str($this->post('messageType'));
        // $isSender = $this->db->escape_str($this->post('isSender'));

        $data = [
            'text' => $text
            // 'messageType' => $messageType,
            // 'isSender' => $isSender
        ];

        $message = $this->message->createMessage($data);
        if ($message > 0) {
            $this->response([
                'status' => true,
                'message' => 'New message inserted'
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'status' => false,
                'message' => "Failed to send a new message"
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
}
?>