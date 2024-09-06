using System;
using System.Collections.Generic;

namespace SRD_SimonBunya.Models;

public partial class Question
{
    public int Id { get; set; }

    public int FormId { get; set; }

    public string? Text { get; set; }

    public string? Key { get; set; }

    public string? QuestionType { get; set; }

    public string? Status { get; set; }

    public virtual Form Form { get; set; } = null!;

    public virtual QuestionType? QuestionTypeNavigation { get; set; }

    public virtual StatusValue? StatusNavigation { get; set; }
}
