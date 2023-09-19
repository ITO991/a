-  task :release => 'db:migrate'
+  task :release

-  task :server do
+  task :server => 'db:migrate' do
     sh 'bin/rails server'
   end