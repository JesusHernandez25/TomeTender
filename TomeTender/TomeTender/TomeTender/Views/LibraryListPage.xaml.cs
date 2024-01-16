using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TomeTender;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace TomeTender
{
	[XamlCompilation(XamlCompilationOptions.Compile)]
	public partial class LibraryListPage : ContentPage
	{
		public ObservableCollection<string> LibraryList { get; set; }
        public ObservableCollection<string> LibraryList2 { get; set; }
        public ObservableCollection<string> LibraryList3 { get; set; }
        public ObservableCollection<string> LibraryList4 { get; set; }

        public LibraryListPage ()
		{
			InitializeComponent ();
            {
               

                LibraryList = new ObservableCollection<string> { "Reading Oasis" };
                LibraryList2 = new ObservableCollection<string> { "Silent Stacks Society"  };
                LibraryList3 = new ObservableCollection<string> { "Bookworm Retreat" };
                LibraryList4 = new ObservableCollection<string> { "Wisdom Vault" };


                LibraryListView.ItemsSource = LibraryList;
                LibraryListView2.ItemsSource = LibraryList2;
                LibraryListView3.ItemsSource = LibraryList3;
                LibraryListView4.ItemsSource = LibraryList4;
            }
        }

	
		
	}
}