module.exports = (app) => {
    app.get("/", (req, res)=>{
        res.send("Estoy en la página '/'");
    });
    app.get("/route", (req, res)=>{
        res.send("Estoy en la página '/route'");
    });
    /**
     * TENER CUIDADO con la ubicación de esta ruta.
     * Si se declarase, deberia ser siempre la última del proyecto.
     * Si estuviese de primera, ninguna otra ruta podria ejecutar
     */
    app.get("*", (req, res)=>{
        res.send("No encontramos la ruta solicitada");
    });
}