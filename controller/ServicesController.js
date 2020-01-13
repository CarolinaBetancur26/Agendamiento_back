const _db = require('../model/_db');
let validator = require('validatorjs');

module.exports = {
    show: function (cb) {
        _db.get('services', function (data) {
            return cb({
                'message': data,
                'status': 200
            });
        });
    }
}