---
swagger: "2.0"
info:
  title: Swagger Petstore test Apicurio
  license:
    name: MIT
  version: 1.0.0
host: petstore.swagger.io
basePath: /v1
schemes:
- http
consumes:
- application/json
produces:
- application/json
paths:
  /pets2:
    get:
      tags:
      - pets2
      summary: List all pets
      operationId: listPets
      parameters:
      - name: limit
        in: query
        description: How many items to return at one time (max 100)
        required: false
        type: integer
        format: int32
      responses:
        200:
          description: An paged array of pets
          schema:
            $ref: '#/definitions/Pets'
          headers:
            x-next:
              description: A link to the next page of responses
              type: string
        default:
          description: unexpected error
          schema:
            $ref: '#/definitions/Error'
    post:
      tags:
      - pets
      summary: Create a pet
      operationId: createPets
      responses:
        201:
          description: Null response
        default:
          description: unexpected error
          schema:
            $ref: '#/definitions/Error'
  /pets/{petId}:
    get:
      tags:
      - pets
      summary: Info for a specific pet
      operationId: showPetById
      parameters:
      - name: petId
        in: path
        description: The id of the pet to retrieve
        required: true
        type: string
      responses:
        200:
          description: Expected response to a valid request
          schema:
            $ref: '#/definitions/Pets'
        default:
          description: unexpected error
          schema:
            $ref: '#/definitions/Error'
definitions:
  Pet:
    required:
    - id
    - name
    properties:
      id:
        format: int64
        type: integer
      name:
        type: string
      tag:
        type: string
  Pets:
    type: array
    items:
      $ref: '#/definitions/Pet'
  Error:
    required:
    - code
    - message
    properties:
      code:
        format: int32
        type: integer
      message:
        type: string
