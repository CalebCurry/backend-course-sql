// db.posts.insertOne({
//     title: 'Guess what just happened at work',
//     author: 'Caleb Curry',
//     body: 'Let me tell you about work...',
//     tags: ['software', 'story time'],
//     created_at: new Date(),
//     updated_at: new Date(),
// // });

// db.posts.updateOne(
//     { _id: ObjectId('64f79ec98e7cba7def34a7e9') },
//     { $pull: { tags: 'intro' } }
// );

// db.posts.find({ tags: 'story time' });

// db.posts.insertOne({
//     title: 'my first post its greatt!!',
//     author: 'John',
//     body: 'im quite interesting',
//     tags: [
//         { name: 'intro', addedAt: new Date() },
//         { name: 'story time', addedAt: new Date() },
//     ],
//     created_at: new Date(),
//     updated_at: new Date(),
// // });

// db.posts.updateOne(
//     { _id: ObjectId('64f7a2c975971408910eb6df') },
//     { $pull: { tags: { name: 'intro' } } }
// );

// db.posts.find({ 'tags.name': 'story time' });

// db.users.insertOne({
//     email: 'caleb@test.com',
//     name: 'Caleb Curry',
//     username: 'calcur',
//     verified: true,
//     notificationSettings: { security: true, comms: false, marketing: false },
//     posts: [
//         {
//             title: 'My First post!',
//             body: 'let me tell you bout myself',
//             tags: ['intro', 'story time'],
//             created_at: new Date(),
//             updated_at: new Date(),
//         },
//         {
//             title: 'My second post!',
//             body: 'let me tell you bout myself more!',
//             tags: ['intro', 'story time extended'],
//             created_at: new Date(),
//             updated_at: new Date(),
//         },
//     ],
// });

// db.users.find({
//     posts: { $exists: true },
// });

// const users = db.users.find().toArray();

// users.forEach((user) => {
//     if (user.posts) {
//         user.posts.forEach((post) => {
//             console.log(post.title);
//         });
//     }
// });

// db.users.aggregate([
//     {
//         $project: {
//             email: 1,
//             object_size: { $bsonSize: '$$ROOT' },
//         },
//     },
// ]);

// db.posts.insertOne({
//     title: 'What is your favorite language?',
//     body: 'mine is assembly',
//     tags: ['software', 'languages'],
//     createdAt: new Date(),
//     updatedAt: new Date(),
//     userId: ObjectId('64f7124ec50919f8ec361c9f'),
// });
//64f859eb48e60f89e7c698c8

// db.createView('postsWithUser', 'posts', [
//     {
//         $lookup: {
//             from: 'users',
//             localField: 'userId',
//             foreignField: '_id',
//             as: 'user',
//         },
//     },
//     {
//         $unwind: '$user',
//     },
//     {
//         $project: {
//             userId: 0,
//             'user.notificationSettings': 0,
//         },
//     },
// ]);

// db.postsWithUser.find();

// db.posts.insertOne({
//     test: 'invalid post',
//     userId: new ObjectId(),
// });

// db.posts.find();

// db.runCommand({
//     collMod: 'posts',
//     validator: {
//         $jsonSchema: {
//             bsonType: 'object',
//             properties: {
//                 _id: {
//                     bsonType: 'objectId',
//                 },
//                 body: {
//                     bsonType: 'string',
//                 },
//                 createdAt: {
//                     bsonType: 'date',
//                 },
//                 tags: {
//                     bsonType: 'array',
//                     items: {
//                         bsonType: 'string',
//                     },
//                 },
//                 title: {
//                     bsonType: 'string',
//                 },
//                 updatedAt: {
//                     bsonType: 'date',
//                 },
//                 userId: {
//                     bsonType: 'objectId',
//                 },
//             },
//             required: [
//                 '_id',
//                 'body',
//                 'createdAt',
//                 'tags',
//                 'title',
//                 'updatedAt',
//                 'userId',
//             ],
//         },
//     },
//     validationLevel: 'strict',
// });

// db.runCommand({
//     collMod: 'users',
//     validator: {
//         $jsonSchema: {
//             bsonType: 'object',
//             title: 'user',
//             properties: {
//                 _id: {
//                     bsonType: 'objectId',
//                 },
//                 email: {
//                     bsonType: 'string',
//                 },
//                 name: {
//                     bsonType: 'string',
//                 },
//                 notificationSettings: {
//                     bsonType: 'array',
//                     items: {
//                         bsonType: 'string',
//                         enum: ['comms', 'marketing', 'security', 'affiliate'],
//                     },
//                 },
//                 username: {
//                     bsonType: 'string',
//                 },
//                 verified: {
//                     bsonType: 'bool',
//                 },
//             },
//             required: ['_id', 'email', 'name', 'username', 'verified'],
//         },
//     },
//     validationLevel: 'strict',
// });

// db.users.insertOne({
//     email: 'Feb@test.com',
//     name: 'Feb Ruary',
//     username: 'FabulousFeb',
//     verified: true,
//     notificationSettings: { security: true },
// });

// db.runCommand({
//     collMod: 'posts',
//     validator: {},
//     validationLevel: 'off'
// });

// db.runCommand({
//     collMod: 'users',
//     validator: {},
//     validationLevel: 'off',
// });

db.users.find();
