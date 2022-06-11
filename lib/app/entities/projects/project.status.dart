enum ProjectStatus {
   inProgress(label: 'Em andamento'),
   finalized(label: 'Finalizado');

   final String label;

   const ProjectStatus({required this.label});


}