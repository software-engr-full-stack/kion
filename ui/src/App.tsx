import * as React from 'react';
import { useTheme } from '@mui/material/styles';
import Box from '@mui/material/Box';
import Drawer from '@mui/material/Drawer';
import CssBaseline from '@mui/material/CssBaseline';

import Toolbar from '@mui/material/Toolbar';
import List from '@mui/material/List';
import Typography from '@mui/material/Typography';
import Divider from '@mui/material/Divider';
import IconButton from '@mui/material/IconButton';
import MenuIcon from '@mui/icons-material/Menu';
import ChevronLeftIcon from '@mui/icons-material/ChevronLeft';
import ChevronRightIcon from '@mui/icons-material/ChevronRight';
import ListItem from '@mui/material/ListItem';
import ListItemButton from '@mui/material/ListItemButton';
import ListItemIcon from '@mui/material/ListItemIcon';
import ListItemText from '@mui/material/ListItemText';

import LocalShippingIcon from '@mui/icons-material/LocalShipping';
import RocketLaunchIcon from '@mui/icons-material/RocketLaunch';
import WorkIcon from '@mui/icons-material/Work';
import ManageAccountsIcon from '@mui/icons-material/ManageAccounts';

import { Main, AppBar, DrawerHeader, drawerWidth } from './components';
import BarChart from './BarChart';
import Donut from './Donut';

import './App.css';

const nameToIconTable: any = {
  UPS: LocalShippingIcon,
  NASA: RocketLaunchIcon,
  Indeed: WorkIcon,
  ManTech: ManageAccountsIcon
};

const monthCodeTable: any = {
  '00': 'January',
  '01': 'February',
  '02': 'March',
  '03': 'April',

  '04': 'May',
  '05': 'June',
  '06': 'July',
  '07': 'August',

  '08': 'September',
  '09': 'October',
  '10': 'November',
  '11': 'December'
}

export default function PersistentDrawerLeft() {
  const [customers, setCustomers] = React.useState([]);
  const [currentCustomer, setCurrentCustomer] = React.useState({
    name: 'Please wait...',
    costs: []
  });
  const [complianceScore, setComplianceScore] = React.useState({ completed: 0, totalChecks: 0 });

  const [open, setOpen] = React.useState(true);

  const theme = useTheme();

  React.useEffect(() => {
    fetch('/api/v1/customers/all-with-children').then((json) => json.json()).then((resp) => {
      const convertPadded = resp.map((cust: any) => ({
        ...cust,
        costs: cust.costs.map((cost: any) => ({
          ...cost,
          monthCode: cost.monthCode.toString().padStart(2, '0')
        }))
      }));

      setCustomers(convertPadded);
      setCurrentCustomer(convertPadded[0]);
      setComplianceScore(convertPadded[0].complianceScores[0]);
    });
  }, []);

  const handleDrawerOpen = () => {
    setOpen(true);
  };

  const handleDrawerClose = () => {
    setOpen(false);
  };

  const handleListItemClick = (cust: any) => {
    setCurrentCustomer(cust);
    setComplianceScore(cust.complianceScores[0]);
  };

  if (customers.length < 1) {
    return null;
  }

  return (
    <Box sx={{ display: 'flex' }}>
      <CssBaseline />
      <AppBar position="fixed" open={open} color="default">
        <Toolbar>
          <IconButton
            color="inherit"
            aria-label="open drawer"
            onClick={handleDrawerOpen}
            edge="start"
            sx={{ mr: 2, ...(open && { display: 'none' }) }}
          >
            <MenuIcon />
          </IconButton>
          <Typography variant="h6" noWrap component="div">
            {currentCustomer.name}
          </Typography>
        </Toolbar>
      </AppBar>
      <Drawer
        sx={{
          width: drawerWidth,
          flexShrink: 0,
          '& .MuiDrawer-paper': {
            width: drawerWidth,
            boxSizing: 'border-box',
          },
        }}
        variant="persistent"
        anchor="left"
        open={open}
      >
        <DrawerHeader>
          <IconButton onClick={handleDrawerClose}>
            {theme.direction === 'ltr' ? <ChevronLeftIcon /> : <ChevronRightIcon />}
          </IconButton>
        </DrawerHeader>
        <Divider />
        <List>
          {
            <List>
              {
                customers.map((cust: any) => {
                  const Icon = nameToIconTable[cust.name];
                  return (
                    <ListItem key={cust.name} disablePadding onClick={() => { handleListItemClick(cust); }}>
                      <ListItemButton>
                        <ListItemIcon>{<Icon />}
                        </ListItemIcon>
                        <ListItemText primary={cust.name} />
                      </ListItemButton>
                    </ListItem>
                  )
                })
              }
            </List>
          }
        </List>
      </Drawer>
      <Main open={open}>
        <DrawerHeader />

        <BarChart
          titleText="Spending"
          data={{
            labels: Object.keys(monthCodeTable).sort().map((mc: string) => monthCodeTable[mc]),
            datasets: [
              {
                label: 'Amount',
                data: currentCustomer.costs.map((cost: any) => cost.amount),
                backgroundColor: 'rgba(255, 99, 132, 0.5)'
              }
            ]
          }}
        />

        <Divider variant="middle" />

        <Donut
          data={{
            labels: ['Checks completed', 'Checks yet to be done'],
            datasets: [
              {
                data: [complianceScore.completed, complianceScore.totalChecks - complianceScore.completed],
                backgroundColor: [
                  'rgba(54, 162, 235, 0.2)',
                  'rgba(255, 99, 132, 0.2)'
                ]
              }
            ]
          }}
        />
      </Main>
    </Box>
  );
}
