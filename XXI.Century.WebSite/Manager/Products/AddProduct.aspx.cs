namespace XXI.Century.WebSite.Manager.Products
{
    using System;
    using System.Linq;
    using Centuty.DataBusiness.Models.Data;
    using Centuty.DataBusiness.Models.Entities;
    using Centuty.DataBusiness.Models.Enums;
    using Centuty.DataBusiness.Services;

    public partial class AddProduct : System.Web.UI.Page
    {
        private readonly ProductTypeService _productTypeService;
        private readonly CategoryService _categoryService;
        private readonly ProductService _productService;

        public AddProduct()
        {
            _productTypeService = new ProductTypeService();
            _categoryService = new CategoryService();
            _productService = new ProductService();
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<ProductTypeEntity> GetTypes()
        {
            return _productTypeService.GetProductTypes();
        }

        public IQueryable<CategoryEntity> GetCategories()
        {
            return _categoryService.GetAllCategory();
        }



        protected void FormSubmit(object sender, EventArgs e)
        {
            Boolean fileOK = false;
            var imageFileName = ProductImage.FileName;
            String path = Server.MapPath("~/Catalog/ProductImages/");
            if (ProductImage.HasFile)
            {
                String fileExtension = System.IO.Path.GetExtension(imageFileName).ToLower();
                String[] allowedExtensions = { ".gif", ".png", ".jpeg", ".jpg" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                        imageFileName = Guid.NewGuid() + fileExtension;
                        break;
                    }
                }
            }

            if (fileOK)
            {
                try
                {
                    // Save to Images folder.
                    ProductImage.PostedFile.SaveAs(path + imageFileName);

                    var productDataModel = new ProductDataModel
                    {
                        Name = InputName.Value,
                        Description = InputDescription.Value,
                        Price = double.Parse(InputPrice.Value),
                        Image = imageFileName,
                        ProductStatus = ProductStatus.WithoutAttributes,
                        ProductTypeId = long.Parse(DropDownAddType.SelectedValue),
                        CategoryId = long.Parse(DropDownListCategory.SelectedValue)

                    };
                    var response = _productService.AddProduct(productDataModel);
                    if (response.CompletedStatus == CompletedStatus.Successed)
                    {
                        var productId = (long) response.Data;
                        Response.Redirect("/Manager/Products/AddProductAttributesValues.aspx?productId=" + productId, false);
                    }
                    else
                    {
                        System.IO.File.Delete(path + imageFileName);
                        LabelAddStatus.Text = "Unable to add new product to database.";
                    }
                }
                catch (Exception ex)
                {
                    System.IO.File.Delete(path + imageFileName);
                    LabelAddStatus.Text = ex.Message;
                }

                // Add product data to DB.

            }
            else
            {
                LabelAddStatus.Text = "Unable to accept file type.";
            }
        }
    }
}