using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.UI.HtmlControls;
using System.Web.Services;

public partial class index : System.Web.UI.Page
{
    [WebMethod]
    public static int getsize()
    {
        return foods.Count;
    }

    [WebMethod]
    public static List<food> getAll(string st,string cu)
    {
        int s = Convert.ToInt32(st);
        int c = Convert.ToInt32(cu);

        if(s+c > foods.Count)
        {
            c = foods.Count - s;
        }

        return foods.GetRange(s, c);
    }
    public class food
    {
        public int id;
        public string fname;
        public string pic;
        public double grade;
        public int price;
        public string describe;

        public food(int id, string fname, string pic, double grade, int price, string describe)
        {
            this.id = id;
            this.fname = fname;
            this.pic = pic;
            this.grade = grade;
            this.price = price;
            this.describe = describe;
        }
    }

    public static List<food> foods = new List<food>();

    protected void Page_Load(object sender, EventArgs e)
    {
        foods.Clear();

        foods.Add(new food(1, "املت زغالی", "24.png", 5, 134, "غذای بسیار خوشمزه"));
        foods.Add(new food(2, "کیک", "23.png", 3.5, 477, "غذای بسیار مزخرف"));
        foods.Add(new food(3, "پلو", "24.png", 2.5, 457, "غذای کمی مزخرف"));
        foods.Add(new food(4, "فسنجان", "25.png", 1.5, 333, "غذای عالی"));
        foods.Add(new food(5, "قورمه سبزی", "37.jpg", 5, 212, "غذای بسیار باب طبع"));
        foods.Add(new food(6, "حاضری", "27.png", 0.5, 678, "غذای بدمزه"));
        foods.Add(new food(7, "بادمجان", "28.png", 3, 36, "غذای بسیار خوش طعم"));
        foods.Add(new food(8, "کدو", "29.png", 1, 412, "غذای خوب"));
        foods.Add(new food(9, "آبگوشت", "30.png", 2, 444, "با طبخ سریع"));
        foods.Add(new food(10, "نیمرو", "31.png", 5, 124, "دارای خاصیت زیاد"));

        foods.Add(new food(11, "ماهیچه", "32.png", 5, 321, "غذای نسبتا قابل خوردن"));
        foods.Add(new food(12, "سلطانی", "35.jpg", 5, 124, "غذای خیلی خوش رنگ"));
        foods.Add(new food(13, "مسما", "36.jpg", 3.5, 110, "غذای بسیار شیرین"));
        foods.Add(new food(14, "آبوغ", "37.jpg", 4, 11, "غذای بندری "));
        foods.Add(new food(15, "زرشک پلو", "38.jpg", 5, 33, "غذای شمالی"));
        foods.Add(new food(16, "آش دوغ", "39.jpg", 3, 212, "غذای بسیار خوشمزه"));
        foods.Add(new food(17, "شله زرد", "40.jpg", 5, 422, "غذای بسیار خوشمزه"));
        foods.Add(new food(18, "سوپ", "42.jpg", 2, 123, "غذای بسیار خوشمزه"));
        foods.Add(new food(19, "مسقطی", "28.png", 5, 55, "غذای بسیار خوشمزه"));
        foods.Add(new food(20, "دلمه", "29.png", 5, 44, "غذای بسیار خوشمزه"));

        foods.Add(new food(22, "خوراک لوبیا", "30.png", 5, 113, "غذای بسیار خوشمزه"));
        foods.Add(new food(23, "عدسی", "31.png", 2, 82, "غذای بسیار خوشمزه"));
        foods.Add(new food(24, "آب زیپو", "32.png", 5, 42, "غذای بسیار خوشمزه"));
        foods.Add(new food(25, "بورانی", "35.jpg", 5, 67, "غذای بسیار خوشمزه"));
        foods.Add(new food(27, "اردک", "36.jpg", 5, 88, "غذای بسیار خوشمزه"));
        foods.Add(new food(28, "کباب غاز", "37.jpg", 4, 45, "غذای بسیار خوشمزه"));
        foods.Add(new food(29, "خورش آلو", "38.jpg", 5, 700, "غذای بسیار خوشمزه"));
        foods.Add(new food(30, "آش رشته", "39.jpg", 3, 120, "غذای بسیار خوشمزه"));
        foods.Add(new food(31, "آش دوغ", "40.jpg", 5, 550, "غذای بسیار خوشمزه"));
        foods.Add(new food(32, "جوجه", "42.jpg", 2, 120, "غذای بسیار خوشمزه"));

    }
}
