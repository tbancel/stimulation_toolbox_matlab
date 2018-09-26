% timer scrits

timers = timerfindall;
n_timers = numel(timers);

for i=1:n_timers
   t =  timers(1,i);
   if ~isempty(t.UserData.stimulation_time)
       disp(t.UserData.executed_stimulation_time)
   end
   disp(t.Name);
end

