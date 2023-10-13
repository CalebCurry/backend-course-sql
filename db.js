db = connect(
    'mongodb+srv://CalebCurry:notpassword@dev.2vopo9h.mongodb.net/forum?retryWrites=true&w=majority'
);

let result = db.users.find();
console.log(result);
