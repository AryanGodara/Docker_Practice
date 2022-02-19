import express from 'express'

import connectToDatabase from './helper.mjs'

const app = express();

app.get('/', (req,res) => {
    res.send('<h2>Hi There!!</h2>');
});

await connectToDatabase();
app.listen(3000);