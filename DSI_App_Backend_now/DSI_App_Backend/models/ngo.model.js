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

import mongoose from 'mongoose'

// const NGODataSchema = new mongoose.Schema(
//   {
//     name:{
//       type:String,
//       required:true
//     },
//     // email:{
//     //   type:String,
//     //   required:false
//     // },
//     Number : {
//       type: String,
//       required: true
//   },

//   },
//   { timestamps: true }
// )

const NGOAdminSchema = new mongoose.Schema(
  {
    name: {
      type: String,
      required: true
    },
    number: {
      type: String,
      required: true
    },
    assignedSchoolList: {
      type: Array,
      required: false
    }
  },
  { timestamps: true }
)

// export const ngodata = mongoose.model('ngoData', NGODataSchema)
export const ngoAdmin = mongoose.model('ngoAdmin', NGOAdminSchema)
