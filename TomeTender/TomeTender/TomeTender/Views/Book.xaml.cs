using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TomeTender.DataModels;
using Xamarin.Essentials;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Book : ContentPage
    {
        ObservableCollection<BookSearchInfo> BookList;
        public Book()
        {
            InitializeComponent();
             BookList = new ObservableCollection<BookSearchInfo>
            {
                new BookSearchInfo{Name = "The Time Machine" , ImageUrl = "https://live.staticflickr.com/3897/33648175756_4bab1f4920_b.jpg" },
                new BookSearchInfo{Name = "The Hound of the Baskervilles" , ImageUrl = "https://i1.pickpik.com/photos/838/964/918/dog-basset-hound-hound-basset-preview.jpg" },
                new BookSearchInfo{Name = "Pride and Prejudice" , ImageUrl = "https://live.staticflickr.com/3112/2827309845_fa91d7f462_b.jpg" },
                new BookSearchInfo{Name = "The Da Vinci Code" , ImageUrl = "https://upload.wikimedia.org/wikipedia/commons/3/34/Leonardo_da_Vinci._Photograph_by_E._Desmaisons_after_a_print_Wellcome_V0027541EL.jpg" },
                new BookSearchInfo{Name = "Harry Potter and the Sorcerer's Stone" , ImageUrl = "https://live.staticflickr.com/2667/3769620397_d2276c8248_b.jpg" },

            };
            BookListView.ItemsSource = BookList;
            //BookListView_ItemTapped += BookListView_ItemTapped;
        }
        private void SearchBar_TextChanged(object sender, TextChangedEventArgs e)
        {
            BookListView.ItemsSource = BookList.Where(s => s.Name.StartsWith(e.NewTextValue));
        }

        private async void BookListView_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (e.Item is BookSearchInfo selectedBook)
            {
                // You can replace the following switch statement with your own logic
                // to navigate to different pages based on the selected book.
                switch (selectedBook.Name)
                {
                    case "The Time Machine":
                        await Navigation.PushAsync(new AboutPage());
                        break;

                    case "The Hound of the Baskervilles":
                        await Navigation.PushAsync(new BookInfo());
                        break;

                    case "Pride and Prejudice":
                        await Navigation.PushAsync(new AboutPage());
                        break;

                    case "The Da Vinci Code":
                        await Navigation.PushAsync(new BookInfo());
                        break;

                    case "Harry Potter and the Sorcerer's Stone":
                        await Navigation.PushAsync(new BookInfo());
                        break;


                    // Add more cases for other books...

                    default:
                        break;
                }

                // Prevent the item from being selected again.
                BookListView.SelectedItem = null;
            }
        }
        //private void OnBookSelected(Object sender, SelectedItemChangedEventArgs e)
        //{
        //    var item = e.SelectedItem;
        //}
    }
}