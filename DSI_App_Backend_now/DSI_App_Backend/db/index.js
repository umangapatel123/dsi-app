// Copyright 2024 Umang Patel
// 
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
// 
//     https://www.apache.org/licenses/LICENSE-2.0
// 
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import mongoose from "mongoose";
import { DB_NAME } from "../constants.js";
import dotenv from "dotenv";

dotenv.config({ path: './.env' });

const connectDB = async () => {
    try {
        const conn = await mongoose.connect(`${process.env.MONGO_URI}/${DB_NAME}`);
        console.log(`MongoDB Connected!! ${conn.connection.host}`);
    } catch (error) {
        console.error(`Error: ${error.message}`);
        process.exit(1);
    }
}

export default connectDB;