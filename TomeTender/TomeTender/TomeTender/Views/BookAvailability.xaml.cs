using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;
using Xamarin.Forms;
using Xamarin.Essentials;

namespace BookAvailability
{
    public partial class MainPage : ContentPage
    {
        public ObservableCollection<string> Library1 { get; set; }
        public ObservableCollection<string> Library2 { get; set; }
        public ObservableCollection<string> Library3 { get; set; }

        public MainPage()
        {
            InitializeComponent();

            Library1 = new ObservableCollection<string> { "Address1", "Availability Status 1", "Number of Books" };
            Library2 = new ObservableCollection<string> { "Address2", "Availability Status 2", "Number of Books" };
            Library3 = new ObservableCollection<string> { "123 street", "Available", "5" };

            Library1ListView.ItemsSource = Library1;
            Library2ListView.ItemsSource = Library2;
            Library3ListView.ItemsSource = Library3;
        }

        // Back Button
        private async void OnBackClicked(object sender, EventArgs e)
        {
            await Navigation.PopAsync();
        }
        //Home Button
        private async void OnHomeClicked(object sender, EventArgs e)
        {
            await Navigation.PopToRootAsync();
        }

        private void OnItemSelected(object sender, SelectedItemChangedEventArgs e)
        {
            if (e.SelectedItem == null)
                return;

            string selectedBook = e.SelectedItem.ToString();

            // Copy to Clipboard
            Clipboard.SetTextAsync(selectedBook);

            DisplayAlert("Item Copied", $"Copied to Clipboard: {selectedBook}", "OK");

            // Deselect the item after displaying the alert
            ((ListView)sender).SelectedItem = null;


        }

    }
}
