package intern
import org.springframework.transaction.annotation.Transactional

@Transactional
class ColorController {

    def productService

    def index() { }

    def addColor(){
        List<Color> colors = productService.getAllColor()
        render(view: "/user/formColor", model: [colors: colors])
    }

    def saveColor(){
        productService.addDataColor(params)

        redirect(url: "/product/formColor")
    }

    def deleteColor(long id){
        productService.deleteDataColor(id)

        redirect(url: "/product/formColor")
    }

    def updateColor(long id){
        productService.updateDataColor(id, params)

        redirect(url: "/product/formColor")
    }
}
