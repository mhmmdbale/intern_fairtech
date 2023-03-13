package intern_fairtech

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/authenticate/"(controller: "auth", action: "authenticate")
        "/login/auth/"(controller: "auth", action: "login")

        "/registerUser/"(controller: "user", action: "registerUser")
        "/user/add/"(controller: "user", action: "addUser")

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')

        "/dashboard"(controller: "dashboard", action: "index")
        "/product"(controller: "product", action: "index")
        "/product/formAdd"(controller: "product", action: "addProduct")
        "/product/saveProduct"(controller: "product", action: "saveProduct")
        "/product/editProduct/$id"(controller: "product", action: "editProduct")
        "/product/updateProduct/$id"(controller: "product", action: "updateProduct")
        "/product/deleteProduct/$id"(controller: "product", action: "deleteProduct")
        "/product/formColor"(controller: "color", action: "addColor")
        "/product/addColor"(controller: "color", action: "saveColor")
        "/product/deleteColor/$id"(controller: "color", action: "deleteColor")
        "/product/editColor/$id"(controller: "color", action: "updateColor")
    }
}
