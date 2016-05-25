declare
  L_start_date  TIMESTAMP;
  l_next_date   TIMESTAMP;
  l_return_date TIMESTAMP;

begin
  l_start_date  := trunc(SYSTIMESTAMP);
  l_return_date := l_start_date;
  for ctr in 1 .. 10 loop
    dbms_scheduler.evaluate_calendar_string('FREQ=MINUTELY; INTERVAL=5; ',
                                            l_start_date,
                                            l_return_date,
                                            l_next_date);
  
    dbms_output.put_line('Next Run on: ' ||
                         to_char(l_next_date, 'mm/dd/yyyy hh24:mi:ss'));
  
    l_return_date := l_next_date;
  
  end loop;
end;
