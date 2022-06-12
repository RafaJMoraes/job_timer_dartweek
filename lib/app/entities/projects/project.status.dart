enum ProjectStatus {
   inProgress(label: 'Em andamento'),
   finalized(label: 'Finalizado'),
   general(label:'Todos');

   final String label;

   const ProjectStatus({required this.label});


}