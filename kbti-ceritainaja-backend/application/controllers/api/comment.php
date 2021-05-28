<?php

use Restserver\Libraries\REST_Controller;

defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Comment extends REST_Controller {
    public function __construct() {
        parent::__construct();
        $this->load->model('Comment_model', 'comment');
    }

    // get data comment
    public function getComment_get() {
        $comment = $this->comment->getComment();
        $this->response($comment, 200);

        // if ($comment != null) {
        //     $this->response([
        //         'status' => true,
        //         'data' => $comment
        //     ], REST_Controller::HTTP_OK);
        // } else {
        //     $this->response([
        //         'status' => false,
        //         'message' => "There is no comment"
        //     ], REST_Controller::HTTP_NOT_FOUND);
        // }
    }

    // create new comment
    public function createComment_post() {
        $idComment = $this->db->escape_str($this->post('idComment'));
        $name = $this->db->escape_str($this->post('name'));
        $comment = $this->db->escape_str($this->post('comment'));

        $data = [
            'idComment' => $idComment,
            'name' => $name,
            'comment' => $comment
        ];

        $comment = $this->comment->createComment($data);
        if ($comment > 0) {
            $this->response([
                'status' => true,
                'message' => 'New comment has been created'
            ], REST_Controller::HTTP_CREATED);
        } else {
            $this->response([
                'status' => false,
                'message' => "Failed to create a new comment"
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    public function deleteComment_post($idComment) {
        // $idComment = $this->db->escape_str($this->input->post('idComment'));
        $comment = $this->comment->deleteComment($idComment);
        if ($comment > 0) {
            // deleted
            $this->response([
                'status' => true,
                // 'idComment' => $idComment,
                'message' => 'comment deleted'
            ], REST_Controller::HTTP_OK);
        } else {
            // id not found
            $this->response([
                'status' => false,
                'message' => "comment not found"
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
        // if ($comment === null) {
        //     $this->response([
        //         'status' => false,
        //         'message' => "Provide an ID"
        //     ], REST_Controller::HTTP_BAD_REQUEST);
        // } else {
        //     // check id in database
        //     if ($comment > 0) {
        //         // deleted
        //         $this->response([
        //             // 'status' => true,
        //             'idComment' => $idComment,
        //             'message' => 'comment deleted'
        //         ], REST_Controller::HTTP_OK);
        //     } else {
        //         // id not found
        //         $this->response([
        //             'status' => false,
        //             'message' => "comment not found"
        //         ], REST_Controller::HTTP_BAD_REQUEST);
        //     }
        // }
    }
}
?>