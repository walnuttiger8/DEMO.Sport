using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using PdfSharp.Drawing;
using PdfSharp.Pdf;
using System.Diagnostics;
using PdfSharp.Drawing.Layout;

namespace Sport.Utils
{
    public class PDFDoc
    {
        private PdfDocument _document;
        private PdfPage _page;
        private XGraphics _graphics;

        public PDFDoc()
        {
            _document = new PdfDocument();
            _page = _document.AddPage();
            _graphics = XGraphics.FromPdfPage(_page);
        }

        public PdfDocument Render(string title, string subTitle, string description)
        {
            var titleFont = new XFont("Verdana", 20, XFontStyle.Bold);
            var titleRectangle = new XRect(0, 0, _page.Width, 35);
            _graphics.DrawString(title, titleFont, XBrushes.Black, titleRectangle, XStringFormats.TopLeft);

            var subTitleFont = new XFont("Verdana", 16, XFontStyle.Regular);
            var subTitleRectangle = new XRect(0, 45, _page.Width, 30);
            _graphics.DrawString(subTitle, subTitleFont, XBrushes.Black, subTitleRectangle, XStringFormats.TopLeft);

            var descriptionFont = new XFont("Verdana", 14, XFontStyle.Regular);
            var descriptionRectangle = new XRect(0, 80, _page.Width, _page.Height);
            var tf = new XTextFormatter(_graphics);
            tf.DrawString(description, descriptionFont, XBrushes.Black, descriptionRectangle, XStringFormats.TopLeft);

            return _document;
        }
    }
}
