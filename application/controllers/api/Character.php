<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');

require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';

class Character extends REST_Controller
{
    public function __construct()
    {
        parent::__construct();
        $this->load->model('Character_Model', 'char');

        $this->methods['index_get']['limit'] = 1000;
    }

    public function index_get()
    {
        $id = $this->get('id_char');
        if ($id === null) {
            $character = $this->char->getCharacter();
        } else {
            $character = $this->char->getCharacter($id);
        }


        if($character)
        {
            $this->response([
                'status' => true,
                'data' => $character
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Didnt Have That ID'
            ], REST_Controller::HTTP_NOT_FOUND);
        }
        
    }

    public function index_delete()
    {
        $id = $this->delete('id_char');

        if ($id === null) {
            $this->response([
                'status' => false,
                'message' => 'provide an id'
            ], REST_Controller::HTTP_BAD_REQUEST);
        } else {
            if ($this->char->deleteCharacter($id) > 0 ) {
                // ok
                $this->response([
                    'status' => true,
                    'id' => $id,
                    'message' => 'id deleted'
                ], REST_Controller::HTTP_OK);
            } else {
                // id not found
                $this->response([
                    'status' => false,
                    'message' => 'id not found'
                ], REST_Controller::HTTP_BAD_REQUEST);
            }
        }
    }

    public function index_post()
    {
        $data = [
            'name_char' => $this->post('name_char'),
            'gender' => $this->post('gender'),
            'star' => $this->post('star'),
            'organization' => $this->post('organization'),
            'origin' => $this->post('origin'),
            'constellation' => $this->post('constellation'),
            'element' => $this->post('element'),
            'weapon' => $this->post('weapon'),
            'vo_japanese' => $this->post('vo_japanese'),
            'vo_chinese' => $this->post('vo_chinese'),
            'vo_english' => $this->post('vo_english')
        ];

        if ($this->char->createCharacter($data) > 0) {
            $this->response([
                'status' => true,
                'message' => 'New Character Has been Added'
            ], REST_Controller::HTTP_ACCEPTED);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Failed to Create New Data'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }

    public function index_put()
    {
        $id = $this->put('id_char');
        $data = [
            'name_char' => $this->post('name_char'),
            'gender' => $this->post('gender'),
            'star' => $this->post('star'),
            'organization' => $this->post('organization'),
            'origin' => $this->post('origin'),
            'constellation' => $this->post('constellation'),
            'element' => $this->post('element'),
            'weapon' => $this->post('weapon'),
            'vo_japanese' => $this->post('vo_japanese'),
            'vo_chinese' => $this->post('vo_chinese'),
            'vo_english' => $this->post('vo_english')
        ];

        if ($this->char->updateCharacter($data, $id) > 0) {
            $this->response([
                'status' => true,
                'message' => 'Modified'
            ], REST_Controller::HTTP_OK);
        } else {
            $this->response([
                'status' => false,
                'message' => 'Failed to Modified Data'
            ], REST_Controller::HTTP_BAD_REQUEST);
        }
    }
}