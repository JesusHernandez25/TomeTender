using System.ComponentModel;
using TomeTender.ViewModels;
using Xamarin.Forms;

namespace TomeTender.Views
{
    public partial class ItemDetailPage : ContentPage
    {
        public ItemDetailPage()
        {
            InitializeComponent();
            BindingContext = new ItemDetailViewModel();
        }
    }
}