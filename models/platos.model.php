<?php

require_once('model.php');

//Las clases siempre empiezan con mayusculas
class PlatosModel extends Model{

    /**
     * @return array
     * Retorna todos los platos almacenados en la tabla platos
     */
    public function getAll() {
        $query = $this->getDb()->prepare('SELECT * FROM platos ORDER BY id DESC');
        $query->execute();
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

    /**
     * @param $id
     * @return array
     * Retorna toda la info de un plato que coincida con el id.
     */
    public function get($id) {
        $query = $this->getDb()->prepare('SELECT * FROM platos WHERE id = ?');
        $query->execute(array($id));

        return $query->fetch(PDO::FETCH_OBJ);
    }

     /**
     * @param $id
     * @return array
     * Retorna todos los platos que compartan el id_categoria($id).
     */
    public function getbyID($id) {
        $query = $this->getDb()->prepare('SELECT * FROM platos WHERE id_categoria = ? ORDER BY nombre ASC');
        $query->execute([$id]);
        return $query->fetchAll(PDO::FETCH_OBJ);
    }

     /**
     * @param $nombre, $detail, $nacionalidad
     * Edito un plato en base al nombre, detail y nacionalidad pasados por parámetro
     */
    public function edit($id, $nombre, $detail, $nacionalidad){
        $query = $this->getDb()->prepare('UPDATE platos SET nombre = ?, detail = ?, nacionalidad = ? WHERE id = ?');
        $query->execute([$nombre,$detail,$nacionalidad, $id]);
        
    }

    /**
     * @param $nombre, $detail, $nacionalidad
     * Agrega un plato en base al nombre, detail y nacionalidad pasados por parámetro
     */
    public function agregar($categorias, $nombre, $detail, $nacionalidad){
         $query = $this->getDb()->prepare("INSERT INTO platos (nombre, detail, nacionalidad, id_categoria) VALUES (?, ?, ?, ?)");
         $query->execute([$nombre, $detail, $nacionalidad]);
        
    }

    /**
     * @param $id
     * Elimina un plato en base al id pasado por parámetro
     */
    public function eliminar($id){
        $query = $this->getDb()->prepare('DELETE FROM platos WHERE id = ?');
        $query->execute([$id]);
    }
}