using System;
using System.Collections.ObjectModel;
using Xamarin.Forms;

namespace TomeTender
{
    public partial class LibraryEvents : ContentPage
    {
        public ObservableCollection<EventModel> EventList { get; set; }

        public LibraryEvents()
        {
            InitializeComponent();

            
            EventList = new ObservableCollection<EventModel>
            {
                new EventModel { Title = "Book Club Meeting", Location = "Library A", Date = DateTime.Now.AddDays(7) },
                new EventModel { Title = "Author Talk", Location = "Library B", Date = DateTime.Now.AddMonths(1) },
                
            };

            
            BindingContext = this;
        }
    }

    public class EventModel
    {
        public string Title { get; set; }
        public string Location { get; set; }
        public DateTime Date { get; set; }
    }
}
