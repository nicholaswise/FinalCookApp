//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace CookingSite.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Term
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Term()
        {
            this.Favorites = new HashSet<Favorite>();
        }
    
        public int TermID { get; set; }
        public string TermName { get; set; }
        public string TermDef { get; set; }
        public string TermInfo { get; set; }
        public string TermPicture { get; set; }
        public string TermVideo { get; set; }
        public Nullable<bool> IsMatch { get; set; }
        public Nullable<bool> IsLiked { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Favorite> Favorites { get; set; }
    }
}
