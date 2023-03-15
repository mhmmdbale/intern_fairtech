package intern
import org.springframework.transaction.annotation.Transactional
import grails.plugin.springsecurity.annotation.Secured

@Secured(['ROLE_ADMIN'])
@Transactional
class ColorController {

    def productService

    def index() {
        List<Color> colors = productService.getAllColor()
        render(view: "/user/color", model: [colors: colors])
    }

    def saveColor(){
        def color = new Color(params)
        color.validate()
        if (color.hasErrors()) {
            // Redirect back to the form
            List<Color> colors = productService.getAllColor()
            render(view: "/user/formColor", model: [colorError : color, colors: colors])
            return
        }
        productService.addDataColor(params)
        flash.message = "Data Berhasil di Simpan"

        redirect(url: "/product/formColor")
    }

    def deleteColor(long id){
        productService.deleteDataColor(id)

        redirect(url: "/product/formColor")
    }

    def updateColor(long id){
        Color check = Color.findById(id)
        if (check.code != params.code){
            def color = new Color(params)
            color.validate()
            if (color.hasErrors()) {
                // Redirect back to the form
                List<Color> colors = productService.getAllColor()
                render(view: "/user/formColor", model: [colorError : color, colors: colors])
                return
            }
        }
        productService.updateDataColor(id, params)
        flash.message = "Data Berhasil di Ubah"
        redirect(url: "/product/formColor")
    }
}
