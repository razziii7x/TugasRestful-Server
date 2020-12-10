<?php

class Character_Model extends CI_Model
{
    public function getCharacter($id = null)
    {
        if ($id === null) {
            return $this->db->get('character')->result_array();
        } else {
            return $this->db->get_where('character', ['id_char' => $id])->result_array();
        }
    }

    public function deleteCharacter($id)
    {
        $this->db->delete('character', ['id_char' => $id]);
        return $this->db->affected_rows();
    }

    public function createCharacter($data)
    {
        $this->db->insert('character', $data);
        return $this->db->affected_rows();
    }

    public function updateCharacter($data, $id)
    {
       $this->db->update('character', $data, ['id_char' => $id]);
       return $this->db->affected_rows();
    }
}