const _db = require('../model/_db');
let validator = require('validatorjs');

module.exports = {
    
    show: async function (sede_id, prestacion_id, cb) {

        const schedule = await this.getQuestions(`SELECT * FROM schedule WHERE sede_id= ${sede_id} AND prestacion_id = ${prestacion_id}`)
        const available = await this.getQuestions(`SELECT * FROM available_days`)
        const available2 = await this.getQuestions(`SELECT * FROM intervals`)
        let final =[]
        let objs =[]
        let objs2 =[]
        let objp =[]
  
        schedule.forEach((sche, index )=> {
            available.forEach((available,_index)=>{
                if(available.available_id == sche.available_id){
                    available2.forEach((available2,_index)=>{
                        if(available2.available_id == available.available_id){
                            objs2.push(available2.hora)                   
                         } 
                    })
                   objs.push({date_initial:available.date_initial,date_finally:available.date_finally, interval: objs2})                   
                }                                  
             }) 
           
             objp.push({[sche.available_id]: objs})
             objs =[]
             objs2 =[]
        });

        // final.push({[sede_id]: {[prestacion_id]: objp } })
        return cb({
            'message': objp,
            'status': 200
        });
    },

    getQuestions: function( query){
          const promise = new Promise((resolve, reject)=>{
            _db.query(`${query}`, function (data) {
                if(typeof data == "object"){
                    resolve(data)
                }else{
                    reject(data)
                }
                  
            });
          })

          return promise
     }
}
