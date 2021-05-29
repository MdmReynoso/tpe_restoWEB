<?php
require_once('models/platos.model.php');
require_once('views/view.php');
require_once('views/view.platos.categorias.php');
require_once('models/categorias.model.php');

class PlatosController {

    private $modelplatos;
    private $view;
    private $modelcategorias;

    //En el constructor hago las conecciones a las 2 bases de datos y
    //a la vista para poder usarlas dentro de esta clase.
    public function __construct(){
        $this->modelplatos = new PlatosModel();
        $this->modelcategorias = new CategoriasModel();
        $this->view = new PlatosCategoriasView();
    }

    //funcion para mostrar home
    public function showHome(){
        $this->view->home();
        
    }
    
    //obtengo todos las categorias y los platos de la base de datos y
    //se los mando a la vista para mostrarlos.
    public function showAllPlatos(){
        $categorias = $this->modelcategorias->getAll();
        $platos = $this->modelplatos->getAll();

        $this->view->platos($categorias, $platos);
    }

    //obtengo todo la info de un plato en particular a partir de la id.
    public function showDetail($id){
        $plato = $this->modelplatos->get($id);
        $categorias = $this->modelcategorias->getAll();
        
        $this->view->detalle($plato, $categorias);
    }

    //obtengo todos los platos pertenecientes a una misma categoria y los muestro.
    public function showPlatos($id){
        $categorias = $this->modelcategorias->getAll();
        $platos = $this->modelplatos->getbyID($id);

        $this->view->platos($categorias, $platos);
    }

    //funcion para mostrar pagina de admin
    public function showAdmin(){
        $categorias = $this->modelcategorias->getAll();
        $platos = $this->modelplatos->getAll();

        $this->view->admin($categorias, $platos);
    }

   //funcion para mostrar el formulario de editar con la info de la base de datos precargada
   //con el id pasado por parametro (cuando aprieto el boton de la tarjeta)
   public function ShowEditar($id, $error=null){
   
    if (!empty($_POST['plato'])) {
        $id = $_POST['plato'];
    } 

    $platos = $this->modelplatos->get($id);
    
    $this->view->ShowEditPlatos($platos, $error);
    }

    //funcion para editar un plato,si esta vacio el nombre, vuelve a mostrar el formulario con un
    //mensaje de error
    public function editar(){
        $id = $_POST['plato'];
        $nombre = $_POST['name'];
        $detail = $_POST['detail'];
        $nacionalidad = $_POST['nacionalidad'];
     

 
        if(!empty($nombre) && !empty($detail) && !empty($nacionalidad)) {
            $this->modelplatos->edit($id, $nombre, $detail, $nacionalidad);
           
            header("Location: " . BASE_URL . 'platos');
        } else
            $this->ShowEditar($id, "Error, campos vacios");
    }

    //funcion para agregar un plato con toda la info que esta en el form de admin.
    public function agregar(){
        $categoria = $_POST['categoria'];
        $nombre = $_POST['name'];
        $detail = $_POST['detail'];
        $nacionalidad = $_POST['nacionalidad'];

        //chequeo que ningun imput este vacio y despues si lo agrego
        if(!empty($nombre) && !empty($detail) && !empty($precio) && !empty($dias)){
            $this->modelplatos->agregar($categoria, $nombre, $detail, $precio, $dias);
            header("Location: " . BASE_URL . 'platos');
        } else  $this->view->showError("No es posible agregar elementos vacios");
    }

    //funcion para eliminar un plato que coincida con el id pasado por parametro 
    //(cuando aprieto el boton que esta en cada tarjeta)
    public function eliminar($id){

        //si lo quiero eliminar desde la pagina de admin, el id se toma desde ahi.
        if (!empty($_POST['plato'])) {
            $id = $_POST['plato'];
        } 

        $this->modelplatos->eliminar($id);
        header("Location: " . BASE_URL . 'platos');
    }

    //Funcion para mostrar errores generales
    public function showError($msg){
        $this->view->showError($msg);
    }
}
