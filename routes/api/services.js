const API_BASE = "/api/services";
/*Controlador*/
const ctrl_services = require("../../controller/ServicesController");

/*Modulo de routes*/
module.exports = function (app) {

    app.get(`${API_BASE}/show`, (req, res) => {
            ctrl_services.show(function (data) {
            res.json(data);
        });
    });

};
