/* 
Copyright (c) 2021 Swift Models Generated from JSON powered by http://www.json4swift.com

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

For support, please feel free to contact me at https://www.linkedin.com/in/syedabsar

*/

import Foundation
struct Created_by : Codable {
	let email_id : String?
	let phone : String?
	let name : String?
	let mobile : String?
	let is_vipuser : Bool?
	let id : String?
	let department : Department?

	enum CodingKeys: String, CodingKey {

		case email_id = "email_id"
		case phone = "phone"
		case name = "name"
		case mobile = "mobile"
		case is_vipuser = "is_vipuser"
		case id = "id"
		case department = "department"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		email_id = try values.decodeIfPresent(String.self, forKey: .email_id)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		mobile = try values.decodeIfPresent(String.self, forKey: .mobile)
		is_vipuser = try values.decodeIfPresent(Bool.self, forKey: .is_vipuser)
		id = try values.decodeIfPresent(String.self, forKey: .id)
		department = try values.decodeIfPresent(Department.self, forKey: .department)
	}

}