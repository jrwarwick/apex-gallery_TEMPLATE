--------------------------------------------------------------------------------
-- Copyright (c) 2012, 2021 Oracle and/or its affiliates.
-- 
-- Licensed under the Universal Permissive License v 1.0 as shown 
-- at https://oss.oracle.com/licenses/upl/
--
--------------------------------------------------------------------------------

declare
    l_context       apex_exec.t_context;

    l_column_groups apex_data_export.t_column_groups;
    l_group_emp     pls_integer;
    l_group_dept    pls_integer;
    l_columns       apex_data_export.t_columns;
    l_export        apex_data_export.t_export;
begin

    apex_session.create_session(
        p_app_id    => 101,
        p_page_id   => 1,
        p_username  => 'DUMMY' );

    l_context := apex_exec.open_query_context(
        p_location    => apex_exec.c_location_local_db,
        p_sql_query   => q'[select e.ename,
       e.job,
       m.ename as manager,
       e.hiredate,
       e.sal,
       d.dname,
       d.loc
  from emp e
  join dept d
    on d.deptno = e.deptno
  left join emp m
    on e.mgr = m.empno
 order by e.deptno]' );

     apex_data_export.add_column_group(
        p_column_groups   => l_column_groups,
        p_idx             => l_group_emp,
        p_name            => 'Employee' );

     apex_data_export.add_column_group(
        p_column_groups   => l_column_groups,
        p_idx             => l_group_dept,
        p_name            => 'Department' );

    apex_data_export.add_column( p_columns => l_columns, p_name => 'DNAME', p_heading => 'Department', p_is_column_break => true );
    apex_data_export.add_column( p_columns => l_columns, p_name => 'ENAME', p_heading => 'Employee', p_column_group_idx => l_group_emp);
    apex_data_export.add_column( p_columns => l_columns, p_name => 'JOB', p_heading => 'Job', p_column_group_idx => l_group_emp);
    apex_data_export.add_column( p_columns => l_columns, p_name => 'MANAGER', p_heading => 'Manager', p_column_group_idx => l_group_emp);
    apex_data_export.add_column( p_columns => l_columns, p_name => 'HIREDATE', p_heading => 'Hire date', p_format_mask => 'DD-MM-YYYY', p_column_group_idx => l_group_emp);
    apex_data_export.add_column( p_columns => l_columns, p_name => 'SAL', p_heading => 'Salary', p_format_mask => 'FML999G999G999G999G990D00', p_column_group_idx => l_group_emp);
    apex_data_export.add_column( p_columns => l_columns, p_name => 'LOC', p_heading => 'Location', p_column_group_idx => l_group_dept);

    -- Todo: Add highlight

    l_export := apex_data_export.export (
        p_context       => l_context,
        p_format        => nvl( :format, apex_data_export.c_format_html ),
        p_columns       => l_columns,
        p_column_groups => l_column_groups );

    apex_exec.close( l_context );

    apex_data_export.download( 
        p_export                => l_export,
        p_stop_apex_engine      => false,
        p_content_disposition   => apex_data_export.c_inline );

exception
    when others then
        apex_exec.close( l_context );
        raise;
end;
