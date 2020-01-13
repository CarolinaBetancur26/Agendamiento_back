const API_BASE = "/api/schedule";
/*Controlador*/
const ctrl_schedule = require("../../controller/ScheduleController");

/*Modulo de routes*/
module.exports = function (app) {

    app.get(`${API_BASE}/show/:sede_id/:prestacion_id`, (req, res) => {
            ctrl_schedule.show(req.params.sede_id, req.params.prestacion_id, function (data) {
            res.json(data);
        });
    });

};
