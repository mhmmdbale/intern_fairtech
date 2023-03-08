package intern_fairtech

class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }

        "/registerUser/"(controller: "user", action: "registerUser")
        "/user/add/"(controller: "user", action: "addUser")

        "/"(view:"/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
