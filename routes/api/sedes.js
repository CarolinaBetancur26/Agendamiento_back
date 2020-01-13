const API_BASE = "/api/sedes";
/*Controlador*/
const ctrl_sedes = require("../../controller/SedesController");

/*Modulo de routes*/
module.exports = function (app) {

    app.get(`${API_BASE}/show`, (req, res) => {
            ctrl_sedes.show(function (data) {
            res.json(data);
        });
    });
  
};
