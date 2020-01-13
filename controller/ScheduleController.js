const _db = require('../model/_db');
let validator = require('validatorjs');

module.exports = {
    
    show: async function (sede_id, prestacion_id, cb) {

        const questions = await this.getQuestions(`SELECT * FROM schedule WHERE sede_id= ${sede_id} AND prestacion_id = ${prestacion_id}`)
        const answer = await this.getQuestions(`SELECT * FROM available_days`)
        const answer2 = await this.getQuestions(`SELECT * FROM intervals`)
        let final =[]
        let objs =[]
        let objs2 =[]
        let objp =[]
  
        questions.forEach((question, index )=> {
            answer.forEach((answer,_index)=>{
                if(answer.available_id == question.available_id){
                    answer2.forEach((answer2,_index)=>{
                        if(answer2.available_id == answer.available_id){
                            objs2.push(answer2.hora)                   
                         } 
                    })
                   objs.push({date_initial:answer.date_initial,date_finally:answer.date_finally, interval: objs2})                   
                }                                  
             }) 
           
             objp.push({[question.available_id]: objs})
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
