# Quick Start

Let's get quickly all brazilian celebrations

### Creating user

> **POST** `/api/users`

**Body:**
```json
{
  "username": "clark",
  "email": "clark@superman.com",
  "password": "loislane"
}
```

### Getting token

> **POST** `/api/auth/local`

**Body:**
```json
{
  "identifier": "clark@superman.com",
  "password": "loislane"
}
```

**Response:**
```json
{
  "jwt": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjU5NDgzNzc5LCJleHAiOjE2NjIwNzU3Nzl9.NLlxVsh36kSImiKmp-TLH9rMdBBcJ8ybIsNHI_sBc6Y"
}
```

### Getting brazilian celebrations

> **GET** `/api/celebrations?Country=BR`

**Headers:**
```json
{
  "Authorization": "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NSwiaWF0IjoxNjU5NDgzNzc5LCJleHAiOjE2NjIwNzU3Nzl9.NLlxVsh36kSImiKmp-TLH9rMdBBcJ8ybIsNHI_sBc6Y"
}
```

**Response:**
```json
{
	"data": [
		{
			"id": 1,
			"attributes": {
				"name": "Natal",
				"date": "2022-12-25",
				"isBusinessDay": false,
				"isRecurrent": true,
				"createdAt": "2022-08-02T23:47:12.508Z",
				"updatedAt": "2022-08-02T23:47:23.578Z",
				"publishedAt": "2022-08-02T23:47:19.979Z"
			}
		}
	],
	"meta": {
		"pagination": {
			"page": 1,
			"pageSize": 25,
			"pageCount": 1,
			"total": 1
		}
	}
}
```
