using System;
using System.Collections.Generic;

namespace SRD_SimonBunya.Models;

public partial class Form
{
    public int Id { get; set; }

    public string? Title { get; set; }

    public string? Key { get; set; }

    public string? Tags { get; set; }

    public DateOnly? CreatedDate { get; set; }

    public DateOnly? LastUpdateDate { get; set; }

    public string? Status { get; set; }

    public virtual ICollection<Question> Questions { get; set; } = new List<Question>();

    public virtual StatusValue? StatusNavigation { get; set; }
}
